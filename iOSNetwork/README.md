<h2>Welcome to IOSNetwork</h2>

Welcome to the benCoding Network Helpers for Titanium project

### Setup 

* Install the bencoding.network module. If you need help here is a "How To" [guide](https://wiki.appcelerator.org/display/guides/Configuring+Apps+to+Use+Modules). 
* You can now use the module via the commonJS require method, example shown below.

<pre><code>
var benCodingNetwork = require('bencoding.network');
</code></pre>

Now we have the module installed and avoid in our project we can start to use the components, see the feature guide below for details.

### IOSNetwork How To Example

Please see the example folder for a "how to" code example.

Features
--------------------

The benCoding Network Helpers provides access to CarrierInfo, CurrentNetworkInfo, 
Apple's Reachability, and more.

<h2>CarrierInfo</h2>
CarrierInfo provides access to the native CTTelephonyNetworkInfo framework object. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Create a new Carrier Info Object");
var carrierInfo = benCodingNetwork.createCarrierInfo();
</code></pre>
<br />
The following properties are currently available:

<b>simCarrierName</b> - Provides access to the carrier name associated with the device's SIM.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get carrier name => " + carrierInfo.simCarrierName);
</code></pre>
<br />
<b>simCarrierCountryCode</b> - Provides access to the carrier Mobile Country Codes (MCCs). This is the country code associated with the carrier on the SIM.  Here is a listing off all the Mobile Country Codes [wikipedia](http://en.wikipedia.org/wiki/List_of_mobile_country_codes)

Below is a sample on how to use this feature.
<pre><code>
Ti.API.info("Get mobile country code => " + carrierInfo.simCarrierCountryCode);
</code></pre>
<br />
<b>simCarrierNetworkCode</b> - Provides access to the carrier's Mobile Network Code. This is the network code associated with the carrier on the SIM.  Here is a listing off all the Mobile Network Codes for the US [wikipedia](http://en.wikipedia.org/wiki/List_of_mobile_network_codes_in_the_United_States)
<pre><code>
Ti.API.info("Get mobile network code => " + carrierInfo.simCarrierNetworkCode);
</code></pre>
<br />
<h2>CurrentNetwork</h2>
CurrentNetwork provides access to the native CNCopyCurrentNetworkInfo object. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Create a new Current Network Info Object");
var currentNetwork = benCodingNetwork.createCurrentNetwork();
</code></pre>
<br />
<b>SSID</b> - Provides access the SSID the device is currently connected.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get SSID => " + currentNetwork.SSID);
</code></pre>

<br />
<b>BSSID</b> - Provides access the BSSID the device is currently connected.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get BSSID => " + currentNetwork.BSSID);
</code></pre>
<br />

<h2>Reachability</h2>

The Reachability component provides a wrapper for the Apple Reachability module. 
For more about Reachability please see the Apple documentation [here](http://developer.apple.com/library/ios/#samplecode/Reachability/Introduction/Intro.html).

Please find an example on how to create this below:
<pre><code>
Ti.API.info("Create a new Reachability Object");
var reachability = benCodingNetwork.createReachability();
</code></pre>
<br />

<b>reachabilityForLocalWiFi</b> - This method provides a boolean result if Local Wifi is enabled. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get reachabilityForLocalWiFi => " + reachability.reachabilityForLocalWiFi());
</code></pre>
<br />

<b>reachabilityWithHostName</b> - This method takes a host name, such as www.benCoding.com and returns a boolean result if the host is reachable. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get reachabilityWithHostName => " + reachability.reachabilityWithHostName("www.apple.com"));
</code></pre>
<br />

<b>hostNameReachableBy</b> - This method takes a host name, such as www.benCoding.com and returns a constant with how it is reachable.  Please find an example on how to create this below:
<pre><code>
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
</code></pre>
<br />

### Twitter

Please consider following the [@benCoding Twitter](http://www.twitter.com/benCoding) for updates 
and more about Titanium.

### Blog

For module updates, Titanium tutorials and more please check out my blog at [benCoding.Com](http://benCoding.com). 

### Licensing & Support

This project is licensed under the OSI approved Apache Public License (version 2). For details please see the license associated with each project.

Contributing
------------

The benCoding Network Helpers is a open source project.  Please help us by contributing to documentation, reporting bugs, forking the code to add features or make bug fixes or promoting on twitter, etc.
