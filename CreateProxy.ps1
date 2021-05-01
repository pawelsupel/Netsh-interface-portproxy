$listenport1 = "80";
$listenport2 = "5000";
$listenport3 = "5001";

$listenaddress = (Get-NetIPConfiguration | Where-Object { $_.NetAdapter.Status -ne "Disconnected" -and $_.InterfaceDescription -like "*OpenVPN*" } ).IPv4Address.IPAddress

$connectport1 = "80"
$connectport2 = "5000"
$connectport3 = "5001"

$connectaddress = "192.198.8.90";

netsh interface portproxy add v4tov4 listenport=$listenport1 listenaddress=$listenaddress connectport=$connectport1 connectaddress=$connectaddress
netsh interface portproxy add v4tov4 listenport=$listenport2 listenaddress=$listenaddress connectport=$connectport2 connectaddress=$connectaddress
netsh interface portproxy add v4tov4 listenport=$listenport3 listenaddress=$listenaddress connectport=$connectport3 connectaddress=$connectaddress

netsh interface portproxy show v4tov4