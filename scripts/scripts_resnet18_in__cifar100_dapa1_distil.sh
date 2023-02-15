#### Train a ReLU pruned model with trainable mask, set the :

### increase lambda to speed up the replacement, otherwise it might not converge to high sparsity
### The lambda also controls the velocity of replacement, the middile velocity may lead to higher accuracy
mkdir -p ./out/

############### Setting 1: lr=0.0001, epoch=150, Adam Optimizer ############### 
#################### This one get the highest accuracy ####################
# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 12 --w_mask_lr 0.0001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 6e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt12_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 1 --arch resnet18_in --ReLU_count 15 --w_mask_lr 0.0001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt15_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 25 --w_mask_lr 0.0001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 2.5e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt25_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 50 --w_mask_lr 0.0001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 2.5e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt50_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

############### Setting 2: lr=0.0002, epoch=150, SGD Optimizer ############### 
#################### This one get the highest accuracy ####################
# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 12 --w_mask_lr 0.0002\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 8e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt12_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 1 --arch resnet18_in --ReLU_count 15 --w_mask_lr 0.0002\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 6e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt15_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 25 --w_mask_lr 0.0002\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt25_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 50 --w_mask_lr 0.0002\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt50_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

############### Setting 3: lr=0.0003, epoch=150, SGD Optimizer ############### 
#################### This one get the highest accuracy ####################
# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 12.9 --w_mask_lr 0.0003\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 8e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt12_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 1 --arch resnet18_in --ReLU_count 15 --w_mask_lr 0.0003\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 6e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt15_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 25 --w_mask_lr 0.0003\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt25_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 50 --w_mask_lr 0.0003\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt50_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

############### Setting 4: lr=0.001, epoch=150, SGD Optimizer ############### 
#################### This one get the highest accuracy ####################
# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 12.9 --w_mask_lr 0.001\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 8e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt12_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 1 --arch resnet18_in --ReLU_count 15 --w_mask_lr 0.001\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 6e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt15_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 25 --w_mask_lr 0.001\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt25_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 50 --w_mask_lr 0.001\
#  --mask_epochs 150 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt50_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

############### Setting 4: lr=0.001, epoch=200, SGD Optimizer ############### 

######### Added weight decay to the Adam Optimizer ######### 
# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 12.9 --w_mask_lr 0.001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 8e1 --batch_size 128 --precision half --dataset cifar100 --ext decayed\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt12_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 0 --arch resnet18_in --ReLU_count 15 --w_mask_lr 0.001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 6e1 --batch_size 128 --precision half --dataset cifar100 --ext decayed\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt15_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

# nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 25 --w_mask_lr 0.001\
#  --mask_epochs 200 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100 --ext decayed\
#  --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
#  --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt25_distil.txt &
# ### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
# ### 

nohup python -u train_cifar.py --gpu 2 --arch resnet18_in --ReLU_count 50 --w_mask_lr 0.001\
 --mask_epochs 200 --epochs 0 --degree 1 --lamda 4e1 --batch_size 128 --precision half --dataset cifar100 --ext decayed\
 --pretrained_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
 --distil --teacher_arch resnet18_in --teacher_path ./train_cifar/resnet18_in__cifar100/cosine_baseline_ReLUs0lr0.1ep400_baseline/best.pth.tar\
 --optim cosine --act_type ReLU_masked_dapa_relay --threshold 0.003 > ./out/resnet18_in_mask_train_dapa1_cnt50_distil.txt &
### Location of checkpoint file, log file, and tb for tensorboard file are in folder: 
### 