//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package lab2;

import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.Eth1G;
import inet.node.ethernet.EthernetLink;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetHub;
import inet.node.ethernet.EthernetSwitch;
import inet.physicallayer.wired.common.WireJunction;


//
// TODO auto-generated type
//
network Net_hub
{
    types:
        channel HostToHub extends EthernetLink
        {
        }
    submodules:
        ethernetHub: EthernetHub {
            @display("p=210,144");
        }
        Host1: EthernetHost {
            eth.duplexMode = false;
            @display("p=126,93");
        }
        Host2: EthernetHost {
            eth.duplexMode = false;
            @display("p=290,90");
        }
        Host4: EthernetHost {
            eth.duplexMode = false;
            @display("p=295,210");
        }
        Host3: EthernetHost {
            eth.duplexMode = false;
            @display("p=138,224");
        }
    connections:
        Host1.ethg <--> HostToHub <--> ethernetHub.ethg++;
        Host2.ethg <--> HostToHub <--> ethernetHub.ethg++;
        Host4.ethg <--> HostToHub <--> ethernetHub.ethg++;
        Host3.ethg <--> HostToHub <--> ethernetHub.ethg++;
}

network Net_switch
{
    types:
        channel HostToSwitch extends EthernetLink
        {
        }
    submodules:
        ethernetSwitch: EthernetSwitch {
            @display("p=210,144");
        }
        Host1: EthernetHost {

            @display("p=126,93");
        }
        Host2: EthernetHost {

            @display("p=290,90");
        }
        Host4: EthernetHost {

            @display("p=295,210");
        }
        Host3: EthernetHost {

            @display("p=138,224");
        }

    connections:
        Host1.ethg <--> HostToSwitch <--> ethernetSwitch.ethg++;
        Host2.ethg <--> HostToSwitch <--> ethernetSwitch.ethg++;
        Host4.ethg <--> HostToSwitch <--> ethernetSwitch.ethg++;
        Host3.ethg <--> HostToSwitch <--> ethernetSwitch.ethg++;
}

network Net_starsOnBus
{
    types:

    submodules:
        hostH: EthernetHost {
            @display("p=314,60");
        }
        hostS1: EthernetHost {
            @display("p=53,107");
        }
        hostS2: EthernetHost {
            @display("p=130,55");
        }
        ethernetHost3: EthernetHost {
            @display("p=505,328");
        }
        ethernetSwitch: EthernetSwitch {
            @display("p=128,143");
        }
        ethernetHub: EthernetHub {
            @display("p=367,136");
        }
        server: EthernetHost {
            @display("p=484,118;i=device/server");
        }
        printer: EthernetHost {
            @display("p=135,343;i=device/printer");
        }
        tap: WireJunction {
            @display("p=17,230;b=16,8");
        }
        tap1: WireJunction {
            @display("p=173,230;b=16,8");
        }
        tap2: WireJunction {
            @display("p=253,230;b=16,8");
        }
        tap3: WireJunction {
            @display("p=311,230;b=16,8");
        }
        tap4: WireJunction {
            @display("p=383,230;b=16,8");
        }
        tap5: WireJunction {
            @display("p=528,230;b=16,8");
        }
    connections:
        hostS1.ethg <--> Eth100M <--> ethernetSwitch.ethg++;
        hostS2.ethg <--> Eth100M <--> ethernetSwitch.ethg++;
        ethernetHub.ethg++ <--> Eth10M <--> tap4.port++;
        tap2.port++ <--> Eth10M <--> tap3.port++;
        tap3.port++ <--> Eth10M <--> tap4.port++;
        tap4.port++ <--> Eth10M <--> tap5.port++;
        server.ethg <--> Eth10M <--> ethernetHub.ethg++;
        hostH.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost3.ethg <--> Eth10M <--> tap3.port++;
        printer.ethg <--> Eth10M <--> tap1.port++;
        tap2.port++ <--> Eth10M <--> ethernetSwitch.ethg++;
        tap.port++ <--> Eth10M <--> tap1.port++;
        tap1.port++ <--> Eth10M <--> tap2.port++;
}


network Net_starsOnBus1
{
    @display("bgb=811,502");
    types:

    submodules:
        hostH: EthernetHost {
            @display("p=574,115");
        }
        hostS1: EthernetHost {
            @display("p=87,192");
        }
        hostS2: EthernetHost {
            @display("p=119,108");
        }
        hostB: EthernetHost {
            @display("p=666,406");
        }
        ethernetSwitch: EthernetSwitch {
            @display("p=188,216");
        }
        ethernetHub: EthernetHub {
            @display("p=610,191");
        }
        server: EthernetHost {
            @display("p=727,173;i=device/server");
        }
        printer: EthernetHost {
            @display("p=296,421;i=device/printer");
        }
        tap: WireJunction {
            @display("p=21,305;b=16,8");
        }
        tap1: WireJunction {
            @display("p=221,306;b=16,8");
        }
        tap2: WireJunction {
            @display("p=332,308;b=16,8");
        }
        tap3: WireJunction {
            @display("p=429,307;b=16,8");
        }
        tap4: WireJunction {
            @display("p=544,308;b=16,8");
        }
        tap5: WireJunction {
            @display("p=784,308;b=16,8");
        }
        ethernetSwitch1: EthernetSwitch {
            @display("p=376,184");
        }
        hostA1: EthernetHost {
            @display("p=308,55");
        }
        server1: EthernetHost {
            @display("p=444,44;i=device/server");
        }
    connections:
        hostS1.ethg <--> Eth100M <--> ethernetSwitch.ethg++;
        hostS2.ethg <--> Eth100M <--> ethernetSwitch.ethg++;
        ethernetHub.ethg++ <--> Eth10M <--> tap4.port++;
        tap2.port++ <--> Eth10M <--> tap3.port++;
        tap3.port++ <--> Eth10M <--> tap4.port++;
        tap4.port++ <--> Eth10M <--> tap5.port++;
        server.ethg <--> Eth10M <--> ethernetHub.ethg++;
        hostH.ethg <--> Eth10M <--> ethernetHub.ethg++;
        hostB.ethg <--> Eth10M <--> tap3.port++;
        printer.ethg <--> Eth10M <--> tap1.port++;
        tap2.port++ <--> Eth10M <--> ethernetSwitch.ethg++;
        tap.port++ <--> Eth10M <--> tap1.port++;
        tap1.port++ <--> Eth10M <--> tap2.port++;
        hostA1.ethg <--> Eth100M <--> ethernetSwitch1.ethg++;
        ethernetSwitch1.ethg++ <--> Eth1G <--> ethernetSwitch.ethg++;
        server1.ethg <--> Eth100M <--> ethernetSwitch1.ethg++;
}



