#define EPOLL
#define HTTPSERVER_IMPL
#include "httpserver.h"

#define SERVER_PORT 6970
#define RESPONSE "default response"

void handle_request(struct http_request_s* request) {
	http_string_t url = http_request_target(request);

	printf("%s\n", url.buf);

	struct http_response_s* response = http_response_init();
	http_response_status(response, 200);
	http_response_header(response, "Content-Type", "text/html");
	http_response_body(response, RESPONSE, sizeof(RESPONSE) - 1);
	http_respond(request, response);
}

int main() {
	printf("> starting server on %d\n", SERVER_PORT);

	struct http_server_s* server = http_server_init(SERVER_PORT, handle_request);
	http_server_listen(server);
}
