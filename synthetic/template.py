def process_template(script, template_name, template_value):

    tname = template_name.upper()
    if isinstance(template_value, list):
        tvalue = f"<{template_value[0]}, {template_value[1]}, {template_value[2]}>"
    else:
        tvalue = template_value

    script = script.replace(f"<<{tname}>>", tvalue)
    return script
