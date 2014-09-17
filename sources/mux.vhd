library ieee;
use ieee.std_logic_1164.all;
entity mux is
    port
    (
        op                   :in  std_logic;
        arithmetic, logic    :in  std_logic_vector(7 downto 0);

        output                  :out std_logic_vector(7 downto 0)
    );
end mux;
architecture mux of mux is
begin
    with op select
						output <= arithmetic   when '0',
											  logic	when others;
end mux;
