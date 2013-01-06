<h1>benCoding.Network for iOS</h1>

Welcome to the benCoding Network Helpers for Titanium project

<h2>Before you start</h2>
* You need Titanium 2.1.4 or greater.
* This module requires iOS 5+.

<h2>Setup </h2>

* Download the latest release from the dist folder ( or you can build it yourself )
* Install the bencoding.network module. If you need help here is a "How To" [guide](https://wiki.appcelerator.org/display/guides/Configuring+Apps+to+Use+Modules). 
* You can now use the module via the commonJS require method, example shown below.

<pre><code>
var network = require('bencoding.network');
</code></pre>

Now we have the module installed and avoid in our project we can start to use the components, see the feature guide below for details.

### IOSNetwork How To Example

Please see the example folder for a "how to" code example.

<h2>Features</h2>
<hr />

The benCoding Network Helpers provides access to CarrierInfo, CurrentNetworkInfo, 
Apple's Reachability, and more.

<h2>Carrier</h2>
Carrier object provides access to the native CTTelephonyNetworkInfo framework object. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Create a new Carrier Object");
var carrier = network.createCarrier();
Ti.API.info("Call the findInfo method to return the carrier details");
var carrierInfo = carrier.findInfo();
</code></pre>
<br />
The findInfo method returns an object with the following properties:
<b>isSimulator</b> - Identifies if you are running on the simulator. Please note the CTTelephonyNetworkInfo framework does not work on the simulator so fake values are returned for testing purposes.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Are we on the simulator? => " + carrierInfo.isSimulator);
<b>carrierName</b> - Provides access to the carrier name associated with the device's SIM.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Get carrier name => " + carrierInfo.carrierName);
</code></pre>
<br />
<b>mobileCountryCode</b> - Provides access to the carrier Mobile Country Codes (MCCs). This is the country code associated with the carrier on the SIM.  Here is a listing of all the Mobile Country Codes [wikipedia](http://en.wikipedia.org/wiki/List_of_mobile_country_codes)

Below is a sample on how to use this feature.
<pre><code>
Ti.API.info("Get mobile country code => " + carrierInfo.mobileCountryCode);
</code></pre>
<br />
<b>mobileNetworkCode</b> - Provides access to the carrier's Mobile Network Code. This is the network code associated with the carrier on the SIM.  Here is a listing of all the Mobile Network Codes for the US [wikipedia](http://en.wikipedia.org/wiki/List_of_mobile_network_codes_in_the_United_States)
<pre><code>
Ti.API.info("Get mobile network code => " + carrierInfo.mobileNetworkCode);
</code></pre>
<br />
<b>isoCountryCode</b> - The ISO country code for the user’s cellular service provider. This is the carrier on the SIM.  Here is a listing of ISO codes [wikipedia](http://en.wikipedia.org/wiki/ISO_3166-1)
<pre><code>
Ti.API.info("Get ISO country code for cellular service provider => " + carrierInfo.isoCountryCode);
</code></pre>
<br />
<b>allowsVOIP</b> - Indicates if the carrier allows VoIP calls to be made on its network.
<pre><code>
Ti.API.info("Mobile service provider supports VOIP => " + carrierInfo.allowsVOIP);
</code></pre>
<br />
<h2>CaptiveNetwork</h2>
CaptiveNetwork provides access to the native CaptiveNetwork framework. Please find an example on how to create this below:
<pre><code>
Ti.API.info("Create a new CaptiveNetwork Object");
var captiveNetwork = network.createCaptiveNetwork();
Ti.API.info("Call the findInfo method to return the network details");
var currentNetwork = captiveNetwork.findInfo();
</code></pre>
<br />
The findInfo method returns an object with the following properties:
<b>isSimulator</b> - Identifies if you are running on the simulator. Please note the CaptiveNetwork framework does not work on the simulator so fake values are returned for testing purposes.
Please find an example on how to create this below:
<pre><code>
Ti.API.info("Are we on the simulator? => " + currentNetwork.isSimulator);
</code></pre>
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

 

<h2>Licensing & Support</h2>

This project is licensed under the OSI approved Apache Public License (version 2). For details please see the license associated with each project.

Developed by [Ben Bahrenburg](http://bahrenburgs.com) available on twitter [@benCoding](http://twitter.com/benCoding)

<h2>Learn More</h2>
<hr />
<h3>Twitter</h3>

Please consider following the [@benCoding Twitter](http://www.twitter.com/benCoding) for updates 
and more about Titanium.

<h3>Blog</h3>

For module updates, Titanium tutorials and more please check out my blog at [benCoding.Com](http://benCoding.com). 
