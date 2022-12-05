#!/usr/bin/ruby -w

for arg in ARGV
	puts arg;
end


def add(a, b)
	return a + b;
end

res = add(ARGV[0].to_i, ARGV[1].to_i);
puts(res);
