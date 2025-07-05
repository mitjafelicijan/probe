#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "sqlite3.h"
#include "data.h"

int main(void) {
	sqlite3 *db;
	int rc;

	rc = sqlite3_open(":memory:", &db);
	if (rc != SQLITE_OK) {
		fprintf(stderr, "Cannot open database: %s\n", sqlite3_errmsg(db));
		return 1;
	}

	rc = sqlite3_deserialize(db, "main", data, data_len, data_len, SQLITE_DESERIALIZE_READONLY);
	if (rc != SQLITE_OK) {
		fprintf(stderr, "Failed to load database: %s\n", sqlite3_errmsg(db));
		sqlite3_close(db);
		return 1;
	}

	printf("Database loaded successfully!\n");

	sqlite3_stmt *stmt;
	const char *sql = "SELECT name FROM sqlite_master WHERE type='table';";
	rc = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
	if (rc == SQLITE_OK) {
		printf("Tables in database:\n");
		while (sqlite3_step(stmt) == SQLITE_ROW) {
			printf("- %s\n", sqlite3_column_text(stmt, 0));
		}
		sqlite3_finalize(stmt);
	}

	sqlite3_close(db);
	return 0;
}
