# using the default hyperparams (of GPT2) (layer_ins=2, extract_layer=11)
# block size of 1024
# batch size of 1 per device
# 1 train epoch
# Reasonable embeds as initial user history (created using dlatk as an average of average of word embeds derived from GPT2)

deepspeed --include localhost:6,7 \
hulm_ar/HULM_AR/run_clm.py \
    --model_name_or_path gpt2 \
    --instantiate_hart \
    --add_history \
    --initial_history /users/nisoni/hulm_ar/HULM_AR/initial_history/initialized_history_tensor.pt \
    --do_train \
    --do_eval \
    --hostname localhost \
    --db HuLM \
    --test_table fb20lbp_upt50_en_train_10pc \
    --dev_table fb20lbp_upt50_en_oosmsgs \
    --output_dir hulm_ar/HULM_AR/experiments/outputs/WithoutOptuna/deepspeed/test/oosmsgs/2WithReasonableInitialHistory \
    --num_train_epochs 1 \
    --per_device_train_batch_size  1 \
    --per_device_eval_batch_size 1 \
    --block_size 1024 \
    --max_train_blocks 15 \
    --max_val_blocks 15 \
    --deepspeed hulm_ar/HULM_AR/config/ds_config.json \
    # --overwrite_output_dir \