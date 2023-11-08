----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 22:44:13
-- Design Name: 
-- Module Name: LogicSelection - Behavioral
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

entity LogicSelection is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sign : in STD_LOGIC;
           opera : in std_logic_vector(1 downto 0);
           sumres : in STD_LOGIC;
           result : out STD_LOGIC);
end LogicSelection;

architecture Behavioral of LogicSelection is
component MUX2to1
    port (
        a,b : in bit;
        out_mux2to1:out bit);
end component;
begin
    Process (sign,opera)
    Begin
        if opera="0-" then result<=sumres;
        
        end if;
    end process;


end Behavioral;
