----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 18:29:48
-- Design Name: 
-- Module Name: Reg1bit - Behavioral
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

entity Reg1bit is
    Port ( D : in STD_LOGIC;
           CLOCK : in STD_LOGIC;
           ENABLE : in STD_LOGIC;
           Q : out STD_LOGIC);
end Reg1bit;

architecture Behavioral of Reg1bit is
begin
Process(CLOCK,ENABLE)
    begin
    if(CLOCK'event and CLOCK ='1') then 
        if ENABLE='1' then
            Q<=D;
        end if;
    end if;
end process;

end Behavioral;
