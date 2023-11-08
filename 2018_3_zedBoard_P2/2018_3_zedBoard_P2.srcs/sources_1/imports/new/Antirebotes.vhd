----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.11.2023 17:41:14
-- Design Name: 
-- Module Name: Antirebotes - Behavioral
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

entity Antirebotes is
    Port ( INPUT : in STD_LOGIC;
           CLOCK,CONT : in STD_LOGIC;
           OUTPUT : out STD_LOGIC);
end Antirebotes;

architecture Behavioral of Antirebotes is
component Reg1bit is 
      Port ( D : in STD_LOGIC;
           CLOCK : in STD_LOGIC;
           ENABLE : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
signal d1tod2:std_logic;

begin
AntiRebote_R1: Reg1bit port map(INPUT,CLOCK,CONT,d1tod2);
AntiRebote_R2: Reg1bit port map(d1tod2,CLOCK,CONT,OUTPUT);




end Behavioral;
