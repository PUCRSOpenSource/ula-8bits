library ieee;
use ieee.std_logic_1164.all;
entity logic8 is
    port
    (
        a, b    :in   std_logic_vector(7 downto 0);
        op      :in   std_logic_vector(2 downto 0);
        s       :out  std_logic_vector(7 downto 0);
    );
end logic8;
architecture logic08 of logic8 is
begin
    L0: entity work.Logic4
        port map(a => a(3 downto 0), b => b(3 downto 0), op => op(2 downto 0), s => s(3 downto 0));
    L1: entity work.Logic4
        port map(a => a(7 downto 4), b => b(7 downto 4), op => op(2 downto 0), s => s(7 downto 4));
end logic08;
