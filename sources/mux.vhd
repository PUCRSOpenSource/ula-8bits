library ieee;
use ieee.std_logic_1164.all;
entity mux is
    port
    (
        op                   :in  std_logic;
        arithmetic, logic    :in  std_logic_vector(7 downto 0);

        output                  :out std_logic
    );
end mux;
architecture mux of mux is
begin
    with op select
        output <= arithmetic    when op = '1'
                  else          logic;
end adder01;
