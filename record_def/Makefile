build:
	gcc -g -m32 -nostdlib linux.s read_record.s record-def.s write_record.s write_records.s -o write_records

run:
	make build
	rm -r -f hey_now.txt
	./hey_now
