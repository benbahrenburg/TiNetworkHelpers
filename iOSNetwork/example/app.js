var benCodingNetwork = require('bencoding.network');
Ti.API.info("module is => " + benCodingNetwork);

Ti.API.info("Create a new Carrier Info Object");
var carrierInfo = benCodingNetwork.createCarrierInfo();
Ti.API.info("Get carrier name => " + carrierInfo.simCarrierName);
Ti.API.info("Get mobile country code => " + carrierInfo.simCarrierCountryCode);
Ti.API.info("Get mobile network code => " + carrierInfo.simCarrierNetworkCode);

Ti.API.info("Create a new Current Network Info Object");
var currentNetwork = benCodingNetwork.createCurrentNetwork();
Ti.API.info("Get SSID => " + currentNetwork.SSID);
Ti.API.info("Get BSSID => " + currentNetwork.BSSID);


Ti.API.info("Create a new Reachability Object");
var reachability = benCodingNetwork.createReachability();
Ti.API.info("Get reachabilityWithHostName => " + reachability.reachabilityWithHostName("www.apple.com"));
Ti.API.info("Get reachabilityForLocalWiFi => " + reachability.reachabilityForLocalWiFi());

var hostReachableByType = reachability.hostNameReachableBy("www.apple.com");

function getReachableType(findType){
	var results = "Oops something went wrong";
	
	if(findType==reachability.NETWORK_STATUS_NOT_REACHABLE){
		results="Not Reachable";
	}	
	
	if(findType==reachability.NETWORK_STATUS_WIFI){
		results="WiFi Network";
	}	

	if(findType==reachability.NEWORK_STATUS_WWAN){
		results="Mobile Network";
	}		
	
	return results;
};

var reachableType=getReachableType(hostReachableByType);
Ti.API.info("Reachable via => " + reachableType);

var win  = Ti.UI.createWindow({backgroundColor:'#fff'});

var container = Ti.UI.createView({
	top:40,
	layout:'vertical'
});
win.add(container);

var carrierLabel = Ti.UI.createLabel({
	color:'#000',
	left:10,
	text:'Carrier Name: ' + carrierInfo.simCarrierName,
	height:40,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(carrierLabel);	
 
var mccLabel = Ti.UI.createLabel({
	top:20,
	color:'#000',
	left:10,
	text:'Carrier Country Code: ' + carrierInfo.simCarrierCountryCode,
	height:40,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(mccLabel);	

var nccLabel = Ti.UI.createLabel({
	top:20,
	color:'#000',
	left:10,
	text:'Network Country Code: ' + carrierInfo.simCarrierNetworkCode,
	height:40,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(nccLabel);

var SSIDLabel = Ti.UI.createLabel({
	top:20,
	color:'#000',
	left:10,
	text:'SSID: ' + currentNetwork.SSID,
	height:40,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});	

container.add(SSIDLabel);

var BSSIDLabel = Ti.UI.createLabel({
	top:20,
	color:'#000',
	left:10,
	text:'BSSID: ' + currentNetwork.BSSID,
	height:40,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});	

container.add(BSSIDLabel);	

win.open();
