import constants
from datetime import date


def add():
    header = "// Generated by the synthetic scene generator\n"
    today = date.today()
    header += f"// {today}\n\n"

    for hdr in constants.headers:
        header += f'#include "{hdr}.inc"\n'

    header += "\n"
    return header