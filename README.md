EtherEver4
disable unnecessary hardfork block


<br>
################################<br>
pm2 start ecosystem.config.js
<br><br>
./build/bin/geth attach /root/my-fork-data/geth.ipc   <br>
> eth.mining  // true가 나오면 성공입니다.  <br>




<br>
<br>
##PM2 mining script## <br>
vi ~/etherever/miner-control.sh   <br>
<br>
#!/bin/bash

# 경로 설정
GETH_PATH="/root/etherever/build/bin/geth"
IPC_PATH="/root/my-fork-data/geth.ipc"

# 종료 신호(SIGTERM) 처리
stop_mining() {
    echo "Stopping miner..."
    $GETH_PATH --exec "miner.stop()" attach $IPC_PATH
    exit 0
}

trap 'stop_mining' SIGTERM

# IPC 파일이 생길 때까지 대기 (노드가 부팅 중일 수 있음)
echo "Waiting for IPC endpoint..."
while [ ! -S "$IPC_PATH" ]; do
    sleep 1
done

# 채굴 시작 (인자 없이 호출)
echo "Starting miner..."
$GETH_PATH --exec "miner.start()" attach $IPC_PATH

# 프로세스 유지
while true; do
    # 노드와 채굴 상태를 주기적으로 체크하여 로그에 출력 (선택 사항)
    # $GETH_PATH --exec "eth.mining" attach $IPC_PATH
    sleep 10
done







<br>
<br>
<br>
pm2 start ~/etherever/miner-control.sh --name "etherever-miner"
<br>
