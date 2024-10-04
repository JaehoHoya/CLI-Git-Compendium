# CLI-Git-Compendium
자주 사용한 cmd 명령어 모음 &amp; git 

colima start --memory 4 --arch x86_64

docker ps -a  도커 명령어로 종료된 컨테이너를 확인!

docker restart oracle //docker restart (이름)

docker ps

jupyter notebook


git  init  

git  add .
git add 파일명

git commit -m “메세지”      

git status  

git mv  (현폴더명) (new폴더명) 

rm -rf  .git 

git rm  —cached  . -rf 

git clone 

# 파이썬 
mac에서는 별도의 prompt를 제공하지 않고 terminal이 prompt역할을 수행한다. 보통 기본 (base) 
conda create -n pytorch_env python=3.9 //pytorch_env라는 가상환경 설치 
가상환경 이동 conda activate pytorch_env 
conda install jupyter 가상환경에 설치 
conda install pytorch torchvision torchaudio cpuonly -c pytorch
python --version
python
>> import torch
>> torch.__version__
>> 쉘 나가기 exit()
>> jupyter notebook 실행 
