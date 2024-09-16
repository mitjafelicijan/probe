default: write read

write:
	zig run main.zig

read:
	echo -e "Reading value back from Redis server"
	{ echo "GET zig"; sleep 1; } | telnet localhost 6379

redis:
	docker run -p 6379:6379 redis
