# using the default hyperparams (of GPT2)
# block size of 1024
# batch size of 1 per device
# 1 train epoch
# no user history

deepspeed --include localhost:6,7 \
hulm_ar/HULM_AR/run_clm.py \
    --model_name_or_path gpt2 \
    --instantiate_hart \
    --do_train \
    --do_eval \
    --hostname localhost \
    --db HuLM \
    --train_table fb20lbp_upt50_en_train_10pc \
    --test_table fb20lbp_upt50_en_non_oosmsgs \
    --output_dir hulm_ar/HULM_AR/experiments/outputs/WithoutOptuna/deepspeed/test/oosusers/0WithoutHistory \
    --num_train_epochs 1 \
    --per_device_train_batch_size  1 \
    --per_device_eval_batch_size 1 \
    --block_size 1024 \
    --max_train_blocks 15 \
    --max_val_blocks 15 \
    --deepspeed hulm_ar/HULM_AR/config/ds_config.json \
    # --overwrite_output_dir \
