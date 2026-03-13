#!/bin/bash

# 경로 설정
GETH_PATH="/root/etherever/build/bin/geth"
IPC_PATH="/root/my-fork-data/geth.ipc"

# IPC 파일 존재 여부 확인
if [ ! -S "$IPC_PATH" ]; then
    echo "오류: IPC 파일을 찾을 수 없습니다. 노드가 실행 중인지 확인하세요."
    exit 1
fi

echo "======================================"
echo "   EtherEver 마이닝 컨트롤 센터"
echo "======================================"
echo " 1) 마이닝 시작 (start)"
echo " 2) 마이닝 중지 (stop)"
echo " 3) 종료 (exit)"
echo "--------------------------------------"
read -p "원하는 작업의 번호를 입력하세요: " choice

case $choice in
    1)
        echo "마이닝 시작 명령을 전송합니다..."
        $GETH_PATH --exec "miner.start()" attach $IPC_PATH
        echo "완료되었습니다."
        ;;
    2)
        echo "마이닝 중지 명령을 전송합니다..."
        $GETH_PATH --exec "miner.stop()" attach $IPC_PATH
        echo "완료되었습니다."
        ;;
    3)
        echo "프로그램을 종료합니다."
        exit 0
        ;;
    *)
        echo "잘못된 입력입니다. 1, 2, 3 중에서 선택해주세요."
        exit 1
        ;;
esac
