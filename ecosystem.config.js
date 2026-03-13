module.exports = {
  apps: [{
    name: "etherever-node",
    script: "./build/bin/geth",
    args: [
      "--datadir /root/my-fork-data",
      "--nodiscover",
      "--miner.etherbase 0x1A043a92232dcd02D1ED851ea387565CAfE41BfE",
      "--syncmode full",
      "--gcmode archive",
      "--allow-insecure-unlock",
      "--http",
      "--http.addr 172.17.0.1",
      "--http.port 8545",
      "--http.corsdomain *",
      "--http.vhosts *",
      "--http.api eth,net,web3,debug,txpool,personal,trace,parity",
      "--ws",
      "--ws.addr 172.17.0.1",
      "--ws.port 8546",
      "--ws.origins *",
      "--ws.api eth,net,web3,debug,txpool,personal,parity",
      "--rpc.txfeecap 0",
      "--miner.gasprice 0",
      "--miner.gaslimit 30000000",
      "--vmodule=miner=3,rpc=1,eth=1",
      "--verbosity 1",
      "--miner.threads 1"
    ].join(" "),
    cwd: "/root/etherever",
    interpreter: "none" // 바이너리 파일 실행 시 필수
  }]
};
