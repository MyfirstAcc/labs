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
import inet.node.ethernet.EthernetHub;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetSwitch;
import inet.physicallayer.wired.common.WireJunction;
import ned.DatarateChannel;
//
// TODO auto-generated type
//
network Net_compound
{
    @display("bgb=424,261");
    types:
        channel ToBus extends DatarateChannel
        {
        }

    submodules:
        switchStar: SwitchStar {
            @display("p=89,47");
        }
        wireJunction: WireJunction {
            @display("p=106,124");
        }
        wireJunction1: WireJunction {
            @display("p=252,124");
        }
        host1: EthernetHost {
            @display("p=269,53");
        }
    connections:
        switchStar.ethg <--> ToBus <--> wireJunction.port++;
        wireJunction.port++ <--> Eth10M <--> wireJunction1.port++;
        host1.ethg <--> ToBus <--> wireJunction1.port++;
}


module SwitchStar
{
    parameters:
        @display("i=old/cloud");
        int K; // Количество ПК в звезде
    gates:
        inout ethg;
    submodules:
        pc[K]: EthernetHost {
            @display("p=231,103");
        }
        switch: EthernetSwitch {
            @display("p=79,104");
        }
    connections:
        for i=0..K-1 {
            switch.ethg++ <--> Eth100M <--> pc[i].ethg;
        }
        switch.ethg++ <--> ethg;
}
