library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity flag0 is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
			y: out STD_LOGIC);
end;

architecture synth of flag0 is
	signal i: integer;
	signal x: STD_LOGIC_VECTOR(15 downto 1);
begin -- N-bit AND of inverted inputs
	AllBits: for i in 15 downto 1 generate
		LowBit: if i = 1 generate
			A1: x(1) <= not a(0) and not a(1);
		end generate;
		OtherBits: if i /= 1 generate
			Ai: x(i) <= not a(i) and x(i-1);
		end generate;
	end generate;
	y <= x(15);
end;