""" Config class for search/augment """
import argparse
import os
from functools import partial
import torch


def get_parser(name):
    """ make default formatted parser """
    parser = argparse.ArgumentParser(name, formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    # print default value always
    parser.add_argument = partial(parser.add_argument, help=' ')
    return parser


def parse_gpus(gpus):
    if gpus == 'all':
        return list(range(torch.cuda.device_count()))
    else:
        return [int(s) for s in gpus.split(',')]


class BaseConfig(argparse.Namespace):
    def print_params(self, prtf=print):
        prtf("")
        prtf("Parameters:")
        for attr, value in sorted(vars(self).items()):
            prtf("{}={}".format(attr.upper(), value))
        prtf("")

    def as_markdown(self):
        """ Return configs as markdown format """
        text = "|name|value|  \n|-|-|  \n"
        for attr, value in sorted(vars(self).items()):
            text += "|{}|{}|  \n".format(attr, value)

        return text

class TrainCifarConfig(BaseConfig):
    def build_parser(self):
        parser = get_parser("CIFAR-10 Training config")
        parser.add_argument('--dataset',  default='cifar10', help='cifar10 / cifar100')
        parser.add_argument('--data_path', default='./data/', help='CIFAR10 / MNIST / FashionMNIST')
        parser.add_argument('--act_type', type=str, default='nn.ReLU', choices = ['nn.ReLU', 'ReLU_masked', 'ReLU_masked_spgrad', 'ReLU_masked_poly'],
             help='Which non-lienar function to be used in the training')
        parser.add_argument('--batch_size', type=int, default=128, help='batch size')
        
        parser.add_argument('--w_mask_lr', type=float, default=0.02, help='lr for weights of trainable mask')
        parser.add_argument('--w_lr', type=float, default=0.1, help='lr for weights')
        parser.add_argument('--w_lr_min', type=float, default=0.00001, help='minimum lr for weights')
        parser.add_argument('--w_momentum', type=float, default=0.9, help='momentum for weights')
        parser.add_argument('--w_weight_decay', type=float, default=5e-4, help='weight decay for weights')
        parser.add_argument('--w_grad_clip', type=float, default=5., help='gradient clipping for weights')
        parser.add_argument('--w_decay_epoch', type=int, default=20, help='lr decay for training')
        # parser.add_argument('--alpha_lr', type=float, default=5e-4, help='lr for alpha')
        parser.add_argument('--alpha_lr', type=float, default=2e-4, help='lr for alpha')
        parser.add_argument('--sparsity', type=float, default=0.0, help='Sparsity ReLU mask')
        parser.add_argument('--lamda', type=float, default=1e1, help='penalty iterm for ReLU mask')
        parser.add_argument('--scale_x2', type=float, default=0.1, help='Scaling factor for x2 term')
        parser.add_argument('--scale_x', type=float, default=0.5, help='Scaling factor for x term')
        parser.add_argument('--alpha_weight_decay', type=float, default=1e-3, help='weight decay for alpha')
        parser.add_argument('--print_freq', type=int, default=100, help='print frequency')
        parser.add_argument('--Num_mask', type=int, default=1, help='Number of pruning mask during training')
        parser.add_argument('--gpus', default='0', help='gpu device ids separated by comma. `all` indicates use all gpus.')
        parser.add_argument('--epochs', type=int, default=200, help='# of training epochs')
        parser.add_argument('--mask_epochs', type=int, default=0, help='Training mask epochs')
        parser.add_argument('--seed', type=int, default=2, help='random seed')
        parser.add_argument('--workers', type=int, default=4, help='# of workers')
        parser.add_argument('--start-epoch', default=0, type=int, metavar='N', help='manual epoch number (useful on restarts)')
        # parser.add_argument('-e', '--evaluate', dest='evaluate', action='store_true', help='evaluate model on validation set')
        parser.add_argument('-e', '--evaluate', default=None, type=str, metavar='PATH',
                            help='path to checkpoint (default: none), evaluate model on validation set')
        parser.add_argument('--pretrained_path', help='Pretained model path')
        
        parser.add_argument('--teacher_arch', default='', type=str, help='Teacher pretained model path')
        parser.add_argument('--teacher_path', type=str, help='Teacher pretained model path')
        parser.add_argument('--checkpoint_path', help='Checkpoint path')
        # parser.add_argument('--pool_type', default='nn.AvgPool2d', help='Pooling layer type')
        # parser.add_argument('--pool_type', default='nn.MaxPool2d', help='Pooling layer type')
        # parser.add_argument('--arch', default='vgg16', help='Model architecture type')
        parser.add_argument('--arch', default='ResNet18', help='Model architecture type') #'resnet18'
        parser.add_argument('--dropout', type=float, default=0, help='Dropout ratio')
        parser.add_argument('--mask_dropout', type=float, default=0, help='Mask Dropout ratio')
        parser.add_argument('--optim', type=str, default='cosine',choices = ['cosine', 'cosine_finetune', 'cosine_rst', 'cos_modified'], help='Optimizer choice')
        parser.add_argument('--precision', type=str, default='full', choices = ['full', 'half'], help='Full precision training or half precision training')
        parser.add_argument('--ext', default='baseline', help='Extension name')
        parser.add_argument('--distil', action='store_true', default=False, help='Using distiling or not')
        return parser

    def __init__(self):
        parser = self.build_parser()
        args = parser.parse_args()
        super().__init__(**vars(args))

        # self.data_path = './data/'
        # self.path = os.path.join(f'searchs_{self.arch}', self.name + str("_{:.0e}".format(self.lat_lamda) + '_Finetune'))
        if self.evaluate:
            str_first = self.optim + '_' + ("baseline_" if self.act_type == 'nn.ReLU' else "")
            str_first +=  "mask_dropout_{}".format(self.mask_dropout) if self.mask_dropout > 0 else ""
            str_folder = "evaluate_cifar" + ("_poly" if self.act_type == 'ReLU_masked_poly' else "") + ("_distil" if self.distil else "")
            if self.mask_epochs == 0:
                self.path = os.path.join(str_folder, f'{self.arch}_{self.teacher_arch}_{self.dataset}', str_first + str("sp{}lr{}ep{}_{}".format(self.sparsity, self.w_lr, self.epochs, self.ext)))
            else:
                self.path = os.path.join(str_folder, f'{self.arch}_{self.teacher_arch}_{self.dataset}', str_first + str("sp{}wm_lr{}mep{}_{}".format(self.sparsity, self.w_mask_lr, self.mask_epochs, self.ext)))
        else:
            str_first = self.optim + '_' + ("baseline_" if self.act_type == 'nn.ReLU' else "")
            str_first +=  "mask_dropout_{}".format(self.mask_dropout) if self.mask_dropout > 0 else ""
            str_folder = "train_cifar" + ("_poly" if self.act_type == 'ReLU_masked_poly' else "") + ("_distil" if self.distil else "")
            if self.mask_epochs == 0:
                self.path = os.path.join(str_folder, f'{self.arch}_{self.teacher_arch}_{self.dataset}', str_first + str("sp{}lr{}ep{}_{}".format(self.sparsity, self.w_lr, self.epochs, self.ext)))
            else:
                self.path = os.path.join(str_folder, f'{self.arch}_{self.teacher_arch}_{self.dataset}', str_first + str("sp{}wm_lr{}mep{}_{}".format(self.sparsity, self.w_mask_lr, self.mask_epochs, self.ext)))
        # self.eval_log = os.path.join("evaluate", f'evaluate_{self.arch}', self.name + str("_lat_lmd_{:.0e}_lr{}ep{}".format(self.lat_lamda, self.w_lr, self.epochs)))
        self.plot_path = os.path.join(self.path, 'plots')
        self.gpus = parse_gpus(self.gpus)
        if self.dataset == "cifar10":
            self.num_classes = 10
            self.x_size = [1, 3, 32, 32]
        elif self.dataset == "cifar100":
            self.num_classes = 100
            self.x_size = [1, 3, 32, 32]


