----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2023 15:53:16
-- Design Name: 
-- Module Name: registro - Behavioral
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

entity registro is
    Port ( D : in STD_LOGIC_VECTOR(7 downto 0);
           CLOCK : in STD_LOGIC;
           ENABLE,RESET : in STD_LOGIC;
           Q : out STD_LOGIC_vector(7 downto 0));
end registro;

architecture Behavioral of registro is
begin
Process(CLOCK,ENABLE,RESET)
    begin
    if RESET = '1' then 
        Q<=(others=>'0');
    else
        if(CLOCK'event and CLOCK ='1') then 
            if ENABLE='1' then
                Q<=D;
            end if;
        end if;
    end if;
end process;

end Behavioral;
