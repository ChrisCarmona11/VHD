----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.10.2023 14:48:18
-- Design Name: 
-- Module Name: Bloque_funcional - Behavioral
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

entity Bloque_funcional is
    Port ( A,B,RESTA_IN: in STD_LOGIC_VECTOR (7 downto 0);
           SEL,WRA,WRB,CLOCK,RESET : in STD_LOGIC;
           CERO,SIGNO: OUT STD_LOGIC;
           MCD,RESTA_OUT: out STD_LOGIC_VECTOR (7 downto 0));
end Bloque_funcional;

architecture Behavioral of Bloque_funcional is
component registro is
     Port ( D : in STD_LOGIC_vector(7 downto 0);
           ENABLE,CLOCK,RESET : in STD_LOGIC;
           Q : out STD_LOGIC_vector(7 downto 0));
end component;
signal mux2to1_8a,mux2to1_8b,s_aa,s_bb:std_logic_vector(7 downto 0);
signal s_signo: std_logic:='0';
begin

R_A: registro port map(mux2to1_8a,wra,clock,reset,s_aa);
R_B: registro port map(mux2to1_8b,wrb,clock,reset,s_bb);
MCD <= s_aa;
mux_a:Process (SEL,A,RESTA_IN)
    BEGIN
        if SEL= '0' then
            mux2to1_8a<=a;
        else
            mux2to1_8a<=RESTA_IN;
        end if;
    END PROCESS;
mux_b:Process (SEL,B,RESTA_IN)
    BEGIN
        if SEL= '0' then
            mux2to1_8b<=b;
        else
            mux2to1_8b<=RESTA_IN;
        end if;
    END PROCESS;
    
comparador: process (s_aa,s_bb)
    begin
        if s_aa<s_bb then
            s_signo<='0';
            CERO<='0';
            
        elsif s_aa>s_bb then
            s_signo<='1';
            CERO<='0';
           
        elsif s_aa=s_bb then
            CERO<='1';
            s_signo<='0';
        end if ;
        
    end process;
SIGNO<=s_signo;
restador: process(s_aa,s_bb,s_signo)
    begin
        if s_signo='0'then 
            RESTA_OUT<= s_bb-s_aa;
        elsif s_signo='1' then 
            RESTA_OUT<= s_aa-s_bb;
        end if;
    end process;
end Behavioral;
