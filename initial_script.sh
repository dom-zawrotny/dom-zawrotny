sudo apt update
sudo apt install software-properties-common -y
sudo apt install python3.8 -y
sudo apt install python3-pip -y

export ML_PATH="$HOME/ml" 
mkdir -p $ML_PATH
python3 -m pip install --user -U virtualenv
cd $ML_PATH && python3 -m virtualenv my_venv
cd $ML_PATH/my_venv && source ./my_venv/bin/activate
python3 -m pip install --user -U pip
python3 -m pip install -U jupyter matplotlib numpy pandas scipy scikit-learn mne
jupyter notebook
