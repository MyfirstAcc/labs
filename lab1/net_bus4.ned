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

package lab1;
import inet.node.ethernet.Eth10M;
import inet.physicallayer.wired.common.WireJunction;
import ned.DatarateChannel;
import inet.node.ethernet.EthernetHost;
//
// TODO auto-generated type
//
network Net_bus4
{
    @display("bgb=654,432;bgi=labs/plan_office,s");
    types:
        channel Z extends Eth10M
        {
            @display("ls=#0080C0,10");
            length = 12m;
        }
        channel C extends Eth10M
        {
            @display("ls=,2");
            length = 7m;
        }
    submodules:
        host1: EthernetHost {
            parameters:
                csmacdSupport = false;
                eth.duplexMode = true;
                @display("p=113,140;i=device/pc");
        }
        host2: EthernetHost {
            parameters:
                csmacdSupport = false;
                eth.duplexMode = true;
                @display("p=448,362;i=device/lan");
        }

        host3: EthernetHost {
            parameters:
                csmacdSupport = false;
                eth.duplexMode = true;
                @display("p=284,330");
        }
        tap1: WireJunction {
            parameters:
                @display("p=111,208");
        }
        tap2: WireJunction {

            @display("p=286,209");
        }
        tap3: WireJunction {

            @display("p=450,207");
        }
    connections:
        host1.ethg <--> C <--> tap1.port++;
        host2.ethg <--> C <--> tap3.port++;
        host3.ethg <--> C <--> tap2.port++;

        tap1.port++ <--> Z <--> tap2.port++;
        tap2.port++ <--> Z <--> tap3.port++;
}
