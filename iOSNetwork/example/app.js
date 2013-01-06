
var network = require('bencoding.network');
Ti.API.info("module is => " + network);

Ti.API.info("Create a new Carrier Info Object");
var carrier = network.createCarrier();
Ti.API.info("Call the findInfo method to return the carrier details");
var carrierInfo = carrier.findInfo();
Ti.API.info("Are we on the simulator? => " + carrierInfo.isSimulator);
Ti.API.info("Get carrier name => " + carrierInfo.carrierName);
Ti.API.info("Get mobile country code => " + carrierInfo.mobileCountryCode);
Ti.API.info("Get mobile network code => " + carrierInfo.mobileNetworkCode);
Ti.API.info("Get ISO country code for cellular service provider => " + carrierInfo.isoCountryCode);
Ti.API.info("Mobile service provider supports VOIP => " + carrierInfo.allowsVOIP);

Ti.API.info("Create a new Current Network Info Object");
var captiveNetwork = network.createCaptiveNetwork();
Ti.API.info("Call the findInfo method to return the network details");
var currentNetwork = captiveNetwork.findInfo();
Ti.API.info("Are we on the simulator? => " + currentNetwork.isSimulator);
Ti.API.info("Get SSID => " + currentNetwork.SSID);
Ti.API.info("Get BSSID => " + currentNetwork.BSSID);

var win  = Ti.UI.createWindow({backgroundColor:'#fff'});

var container = Ti.UI.createView({
	top:10,
	layout:'vertical'
});
win.add(container);

var carrierLabel = Ti.UI.createLabel({
	color:'#000',
	left:10,
	text:'Carrier Name: ' + carrierInfo.carrierName,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(carrierLabel);	
 
var mccLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'Carrier Country Code: ' + carrierInfo.mobileCountryCode,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(mccLabel);	

var nccLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'Network Country Code: ' + carrierInfo.mobileNetworkCode,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(nccLabel);

var isoLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'Providers ISO Code: ' + carrierInfo.isoCountryCode,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(isoLabel);

var voipLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'Providers Supports VOIP: ' + carrierInfo.allowsVOIP,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});
container.add(voipLabel);

var SSIDLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'SSID: ' + currentNetwork.SSID,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});	

container.add(SSIDLabel);

var BSSIDLabel = Ti.UI.createLabel({
	top:10,
	color:'#000',
	left:10,
	text:'BSSID: ' + currentNetwork.BSSID,
	height:30,
	width:'auto',
	textAlign:'left',
	font:{
		fontSize:16,
		fontWeight:'bold'
	}
});	

container.add(BSSIDLabel);	


win.open();

