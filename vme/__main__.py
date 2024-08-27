from . import send, send_file
import sys

def die_usage():
    print("Usage:\n"
          "        python3 -m vme bot-key any_file\n"
          "        python3 -m vme bot-key < text_or_image_file\n"
          "        echo your message | python3 -m vme bot-key"
          )
    exit(1)

def main():
    if len(sys.argv) < 2:
        die_usage()

    key = sys.argv[1]

    if sys.stdin.isatty():
        if len(sys.argv) != 3:
            die_usage()
        send_file(key, sys.argv[2])
    else:
        data = sys.stdin.buffer.read()
        send(key, data)

if __name__ == '__main__':
    main()

### vme/__main__.py ends here
