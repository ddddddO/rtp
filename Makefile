# go run main.go
# ffmpeg -re -i testdata/input.mp4 -c:a copy -vn -f rtp rtp://localhost:8080
# ffmpeg -re -i testdata/input.mp4 -c:v copy -an -f rtp rtp://localhost:8080

# PowerShellで
# ①
# PS C:\DEV\workspace\GO\src\github.com\ddddddO\rtp\testdata> ffplay udp://localhost:8080
# PS C:\DEV\workspace\GO\src\github.com\ddddddO\rtp\testdata> ffmpeg -i input.mp3 -f mp3 udp://localhost:8080
# を実行。これで音声の再生ができた。
# また、
# ②
# PS C:\DEV\workspace\GO\src\github.com\ddddddO\rtp\testdata> ffplay -protocol_whitelist "file,rtp,udp" x.sdp
# PS C:\DEV\workspace\GO\src\github.com\ddddddO\rtp\testdata> ffmpeg -i input.mp3 -f rtp rtp://localhost:8080
# で、rtpストリームで音声の再生ができた。

# TODO: なので、
# ffplay -protocol_whitelist "file,rtp,udp" x.sdp
# でストリームの受信待ちし、
# rtpパケットを作るgoサーバーを立ち上げ、
# ffmpeg -i input.mp3 -f mp3 udp://localhost:<goサーバーポート>
# でffmpegで送信したmp3のデータをgoサーバーでrtpパケットに変換し、goサーバーがffplayが待ち受けているポートへ送信して音声が再生されれば、成功

# 懸念は、x.sdpがrtpとどうかかわってくるのか？

# いけるのか、、