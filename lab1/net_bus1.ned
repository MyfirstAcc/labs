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
network Net_bus1
{
    @display("bgb=300,348");
    types:
        channel Z extends Eth10M
        {
            length = 10000m;
        }
        channel C extends Eth10M
        {
            length = 1cm;
        }
    submodules:
        host1: EthernetHost {
            parameters:
                eth.duplexMode = false;

                @display("p=245,91");
        }
        host2: EthernetHost {
            parameters:
                eth.duplexMode = false;

                @display("p=243,227");
        }
        tap1: WireJunction {
            parameters:

                @display("p=66,89");
        }
        tap2: WireJunction {

            @display("p=66,149");
        }
        tap3: WireJunction {

            @display("p=66,228");
        }
    connections:
        host1.ethg <--> C <--> tap1.port++;
        host2.ethg <--> C <--> tap3.port++;

        tap1.port++ <--> Eth10M <--> tap2.port++;
        tap2.port++ <--> Z <--> tap3.port++;
}
