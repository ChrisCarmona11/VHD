----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2023 16:40:34
-- Design Name: 
-- Module Name: Multiplic_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplic_1 is
    Port ( pin : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           pout : out STD_LOGIC;
           cout : out STD_LOGIC);
end Multiplic_1;
architecture Behavioral of Multiplic_1 is

begin
pout<= (a AND b)xor pin xor cin;
cout<= (a and b and pin) or (cin and ((a and b) xor pin));

end Behavioral;
