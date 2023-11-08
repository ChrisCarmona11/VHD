----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2023 17:08:10
-- Design Name: 
-- Module Name: Machine - Behavioral
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

entity ProcessingUnit is
    Port ( A,B : IN STD_LOGIC_VECTOR (7 downto 0);
           CLOCK,ENTER,RESET: IN STD_LOGIC;
           FINAL:   OUT STD_LOGIC;
           MCD : OUT STD_LOGIC_VECTOR (7 downto 0));
end ProcessingUnit;

architecture Behavioral of ProcessingUnit is
Component state_machine is
    Port ( ENTER,CERO,SIGNO,RESET,CLOCK: IN std_logic;
           WRA,WRB,SEL,FINAL: out std_logic);
end component;
Component bloque_funcional is
    Port ( A,B,RESTA_IN: in STD_LOGIC_VECTOR (7 downto 0);
           SEL,WRA,WRB,CLOCK,RESET: in STD_LOGIC;
           CERO,SIGNO: OUT STD_LOGIC;
           MCD,RESTA_OUT: out STD_LOGIC_VECTOR (7 downto 0));
end component;
signal s_cero,s_signo: std_logic;
signal s_wra,s_wrb,s_sel: std_logic;
signal s_resta : std_logic_vector (7 downto 0) := (others => '0');
signal s_mcd : std_logic_vector (7 downto 0);


begin

U_LOGIC: state_machine port map (ENTER,s_cero,s_signo,RESET,CLOCK,s_wra,s_wrb,s_sel,FINAL);
U_FUNTIONAL: bloque_funcional port map (A,B,s_resta,s_sel,s_wra,s_wrb,CLOCK,RESET,s_cero,s_signo,s_mcd,s_resta);

MCD<=s_mcd;

end Behavioral;
