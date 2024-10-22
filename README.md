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






LM (Large Language Model )

Llama 3 (meta Ai 사에서 배포 )
Huggingface.co
GGUF   포멧  

Llama 3+ Korean 
LLM  +서버+ 웹 
LLM  +Python 
서버: LM  studio 가 제공하는 웹서버 ,
		Ollama( 로컬에서 LLM을 쉽게 사용할 수 있게 해주는 도구 ,서버제공

requests 파이썬 : 웹서버에 접속할 수 있는 모듈 

LLM+ 서버 + 스프링 웹 

LS 스트듀오를 통해서 쉽게 언어모델 다운로드하기 





Prompt Engineering 
- 언어 모델에 대해서 어떻게 질의에 대해서 구조화할까”?


Zero-shot , one -shot , Few -shot  

Chain of Thoughts :
Context Prompting :

Ollama : 언어모델 로컬에서 실행, 서버 11434 실행 
-다운로드 실행 
-import ollama 

-cLI 명령어도 사용가능 


 Modelfile 이라는 파일에 모델이 위치한 경로를 등록해야한다 

FROM C:/Users/SKU202-0.cache/lm-studio/models/MLP-KTLim/llama-3-Korean-Bllossom-8B-gguf-Q4_K_M/llama-3-Korean-Bllossom-8B-Q4_K_M.gguf


Ollama list 


 touch Modelfile 확장자 없는 파일 생성 
실행
ollama run llama-3-Korean-Bllossom-8B-Q4_K_M.gguf

생성
ollama create llama-3-Korean-Bllossom-8B-Q4_K_M.gguf -f Modelfile


http://localhost:11434

Ollama run … : 콘솔에서 모델과 대화 가능
Ollama serve: 서버만 실행됨 ,콘솔 대화 불가 

# 임시 도커 명령어 모음 ㅈ같은 경험 
- colima start --memory 4 --arch x86_64 : 도커사용 , 도커 데스크탑 응용프로그램은 무거움, 
- 오라클 이미지 다운
  - docker search oracle-11g-xe
  - docker pull jaspeen/oracle-xe-11g
- 도커 이미지 목록 
  - docker images
 
- 도커 컨테이너 목록 ( 실행중, 모든 목록 )
   - docker ps , docker ps -a
- 컨테이너 생성
  - docker run --name oracle11 -d -p 8080:8080 -p 1521:1521 gvenzl/oracle-xe
- 시스템 재부팅시 토커 실행
  - docker update --restart always oracle11

-docker exec -it oracle11 sqlplus system/oracle : sql 시스템 접속 
-docker rm $(docker ps -aq) : 도커 컨테이너 삭제 
-docker stop $(docker ps -aq) : 컨테이너 종료 
