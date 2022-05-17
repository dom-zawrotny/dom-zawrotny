
sudo apt-get -y update
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc

pyenv init

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


pyenv install 3.7.12
pyenv local 3.7.12
export ML_PATH="$HOME/ml" 
mkdir -p $ML_PATH
cd $ML_PATH && python3 -m virtualenv ml_venv

cd $ML_PATH/ml_venv && mkdir resources
gsutil cp gs://dz-mt-350023/ml/pracaMagisterska.ipynb .
gsutil cp gs://dz-mt-350023/ml/dane_eeg.zip resources/
cd $ML_PATH/ml_venv && source ./bin/activate
python3 -m pip install -U pip
python3 -m pip install -U jupyter matplotlib numpy pandas scipy scikit-learn mne tensorflow PyWavelets
# jupyter notebook
