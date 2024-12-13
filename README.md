```
war, jar 파일 만들었으면 도커 빌드
docker build -t fitizen:1.0 .
docker images 생성된 이미지 확인
docker login
docker tag fitizen:1.0 myusername/fitizen:1.0  
도커 푸시 
docker push [DockerHub_Username]/fitizen:1.0

Docker hub에 업로드된 이미지 확인
 Docker Desktop > Images > Hub
도커에서 퍼블릭으로 변경하기 view in hub  ->rapagitory
그다음은 퓨티 인스턴스 접근하여  실행 
푸티에서 docker pull --platform linux/arm64 jaehohoya/fitizen:1.0
먁북에서 한거라 ..시발 이렇게 해야하네 
<강사 코드>>
프로젝트를 jar 파일로 패키징하기

프로젝트 루트 디렉토리로 CMD을 통해 이동
mvnw clean package
https://www.jetbrains.com/help/idea/compiling-applications.html#package_into_jar

target 디렉토리에 생성된 jar 파일 확인
이름변경 예) spring-web.jar

생성된 jar 파일 실행해보기
java -jar spring-web.jar

호스트 시스템의 환경변수 등 jar 파일에 포함할 수 없는 값을 사용하면 jar 파일을 실행하는 중에 오류 발생함
오류 메시지에는 오류의 원인을 기록한 파일의 위치가 포함되어 있으므로 참조하여 오류의 발생 원인 해소 가능
환경변수의 값을 사용하는 대신에 application.properties 를 사용하는 방식으로 전환

application.properties에 선언
 - app.name="SpringWeb"
클래스에서 위의 선언된 값 사용, 변수선언 위에 @Value 사용
 - @Value("${app.name}") String appName 형식으로 전환

Docker Desktop 설치
 - https://docs.docker.com/desktop/setup/install/windows-install/
 - Docker Hub 사이트(https://hub.docker.com/)에서 회원가입

 - Docker Desktop이 실행 중일 때 docker 명령어를 사용할 수 있음
 - Docker 컨테이너는 일종의 가상화 소프트웨어이지만 OS를 포함하지는 않음
 - VMWare 와 비교해보면 이해가 쉬움
 - docker --version
 - docker-compose --version

docker 명령어를 사용하여 배포할 프로젝트를 docker 이미지로 생성
docker 명령어를 사용하여 생성된 이미지를 로컬 시스템에서 실행했을 때 문제가 없는지 확인

dockerfile의 예
FROM openjdk:21-jdk-slim   # FROM openjdk:17-jdk  FROM openjdk:21-jdk-alpine, FROM openjdk:21-jdk-slim
WORKDIR /app
COPY spring-web.jar spring-web.jar
ENTRYPOINT ["java", "-jar", "/app/spring-web.jar"]

도커 이미지 생성
docker build -t spring-web:1.0 .   <- 현재 디렉토리(.)에서 dockerfile를 찾아 빌드작업 수행
docker images
docker run -d -p 80:80 spring-web:1.0
docker ps                   : 컨테이너가 실행 중이면 웹브라우저에서 http://localhost으로 접속
docker stop <컨테이너 아이디>
docker container prune          <- 중지된 컨테이너 삭제
docker rmi <IMAGE ID>         <- 이미지 삭제
docker rmi -f <IMAGE ID>      <- 이미지 강제삭제

Docker에서 Volume을 설정하는 예
docker run -d -p 80:80 -v $(pwd)/static:/static spring-web

docker login -u cwiskykim@gmail.com
Password:
Login Success

docker images
Docker hub의 형식에 맞춤(Tagging)
docker tag <이미지이름> cwisky/spring-web:1.0
docker images

Docker hub에 업로드
docker push cwisky/spring-web:1.0

Docker hub에 업로드된 이미지 확인
 Docker Desktop > Images > Hub


Docker Desktop
 - docker 명령어를 사용하기 위해서 설치
 - 실행 중일 때만 docker 명령어를 사용할 수 있다
 - 배포할 애플리케이션을 docker 이미지로 생성
 - docker 명령어를 사용하여 docker hub에 도커 이미지를 업로드
 - AWS EC2 인스턴스에서 docker 명령어를 사용하여 docker hub에 등록된 이미지를 다운로드
 - AWS EC2에 다운로드된 이미지를 docker 명령으로 실행
```


```sql
- war
./mvnw clean package -DskipTests
docker build -t fitizen:1.0 .
이미지 파일 업로드 확인 
docker images
docker logs c9c6067f29f0
docker exec -it c9c6067f29f0 ls /app/upload
docker run -d -p 80:80 fitizen:1.0
docker rmi <이미지 아이디 >
```
-----------
zip -d <jar file name>.jar META-INF/*.RSA META-INF/*.DSA META-INF/*.SF
docker run -d -p 80:80 --name spring-web-container spring-web:1.2 -- 백그라운드 실행 

docker build -t fitizen:1.0 . ->  war 파일 빌드
 docker logs c9c6067f29f0 -> 스프링 로고 보는법  저거 아이디는 도커 ps 에서 확인 

docker tag <이미지 어아다>   도커 아이디/이미지 이름:버전 엔터  이미지 이름 바꾼거 똑같이 생성 및 

hub에 올리기 

docker login -u 이메일
페스워드 입력 : 
로그인 성공 
docker push   도커 아이디/이미지 이름:버전 엔터

docker stop

허브 -> view 리파지토리스  해당된거 클릭  밑에  설정  리파지토리 세팅스 클릭 퍼블릭을 ㅗ변경 
--------


Spring Boot에서 Python 서버(FastAPI)에서 제공하는 값을 가져오려면, Spring Boot에서 HTTP 클라이언트를 사용해 Python 서버에 요청을 보내면 됩니다. Spring에서는 RestTemplate이나 WebClient를 사용하여 HTTP 요청을 보낼 수 있습니다.

아래는 Spring Boot에서 RestTemplate을 사용하여 Python 서버의 데이터를 가져오는 방법입니다.

# 라마 3 다운  및 테스트 
텍스트 파일 에 FROM 라마 파일 위치 (c://asdasd)
ollama create llama-3-Korean-Bllossom-8B-Q4_K_M.gguf -f Modelfile
0llama run llama-3-Korean-Bllossom-8B-Q4_K_M.gguf


# CLI-Git-Compendium
자주 사용한 cmd 명령어 모음 &amp; git 

colima start --memory 4 --arch x86_64

docker ps -a  도커 명령어로 종료된 컨테이너를 확인!

docker restart oracle //docker restart (이름)

docker ps

docker start oracle

docker exec -it oracle sqlplus


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
