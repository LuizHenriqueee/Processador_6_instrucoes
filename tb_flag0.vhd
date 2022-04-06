library IEEE; use IEEE.STD_LOGIC_1164.all;
entity tb_flag0 is -- no inputs or outputs
end;
architecture sim of tb_flag0 is

 component flag0 is 
	port(	a: in STD_LOGIC_VECTOR(15 downto 0);
		    y: out STD_LOGIC);
end component;

 signal a: STD_LOGIC_VECTOR(15 downto 0);
 signal y: STD_LOGIC:='0';

begin
 -- instantiate device under test
 du: flag0 port map(a=>a,
                    y=>y);
a<="0000100000100000" after 70 ns, 
   "0000000000000000" after 160 ns,
   "0010000000000000" after 190 ns;
end;