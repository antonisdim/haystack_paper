conda activate rip

mkdir sigma_outputs/
mkdir sigma_outputs/input_10K
mkdir sigma_outputs/input_100K
mkdir sigma_outputs/input_1M
mkdir sigma_outputs/input_10M
mkdir sigma_outputs/input_100M

time -v ./Sigma/bin/sigma-align-reads -c sigma_config_input_10K.cfg -w sigma_outputs/input_10K -p `grep -c ^processor /proc/cpuinfo`; ./Sigma/bin/sigma-build-model -c sigma_config_input_10K.cfg -w ./sigma_outputs/input_10K/; ./Sigma/bin/sigma-solve-model -t `grep -c ^processor /proc/cpuinfo` -c sigma_config_input_10K -w ./sigma_outputs/input_10K/; mv sigma_out.* ./sigma_outputs/input_10K/

time -v ./Sigma/bin/sigma-align-reads -c sigma_config_input_100K.cfg -w sigma_outputs/input_100K -p `grep -c ^processor /proc/cpuinfo`; ./Sigma/bin/sigma-build-model -c sigma_config_input_100K.cfg -w ./sigma_outputs/input_100K/; ./Sigma/bin/sigma-solve-model -t `grep -c ^processor /proc/cpuinfo` -c sigma_config_input_100K -w ./sigma_outputs/input_100K/; mv sigma_out.* ./sigma_outputs/input_100K/

time -v ./Sigma/bin/sigma-align-reads -c sigma_config_input_1M.cfg -w sigma_outputs/input_1M -p `grep -c ^processor /proc/cpuinfo`; ./Sigma/bin/sigma-build-model -c sigma_config_input_1M.cfg -w ./sigma_outputs/input_1M/; ./Sigma/bin/sigma-solve-model -t `grep -c ^processor /proc/cpuinfo` -c sigma_config_input_1M -w ./sigma_outputs/input_1M/; mv sigma_out.* ./sigma_outputs/input_1M/

time -v ./Sigma/bin/sigma-align-reads -c sigma_config_input_10M.cfg -w sigma_outputs/input_10M -p `grep -c ^processor /proc/cpuinfo`; ./Sigma/bin/sigma-build-model -c sigma_config_input_10M.cfg -w ./sigma_outputs/input_10M/; ./Sigma/bin/sigma-solve-model -t `grep -c ^processor /proc/cpuinfo` -c sigma_config_input_10M -w ./sigma_outputs/input_10M/; mv sigma_out.* ./sigma_outputs/input_10M/

time -v ./Sigma/bin/sigma-align-reads -c sigma_config_input_100M.cfg -w sigma_outputs/input_100M -p `grep -c ^processor /proc/cpuinfo`; ./Sigma/bin/sigma-build-model -c sigma_config_input_100M.cfg -w ./sigma_outputs/input_100M/; ./Sigma/bin/sigma-solve-model -t `grep -c ^processor /proc/cpuinfo` -c sigma_config_input_100M -w ./sigma_outputs/input_100M/; mv sigma_out.* ./sigma_outputs/input_100M/

