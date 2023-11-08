----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 17:33:27
-- Design Name: 
-- Module Name: Contador - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador is
    Port ( INPUT : in STD_LOGIC;
           OUTPUT : out STD_LOGIC);
end Contador;

architecture Behavioral of Contador is


signal s_cuenta: std_logic_vector(22 downto 0):=(others => '0');
begin
process(INPUT,s_cuenta)
begin 
    if INPUT'event and INPUT='1' then
        if (s_cuenta>=5000000)then
            OUTPUT<='1';
            s_cuenta<= (others=> '0');
        else
            s_cuenta<=s_cuenta+'1';
            OUTPUT<='0';
        end if;
    end if;
end process;

end Behavioral;
