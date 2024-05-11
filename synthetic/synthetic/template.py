def process_template(script, template_name, template_value):
    """
    Replaces placeholders in a script with specified values.

    This function searches for placeholders in the format `<<TEMPLATE_NAME>>` within the given script and replaces them
    with `template_value`. If `template_value` is a list, it formats it as a POV-Ray vector `<x, y, z>`.

    Args:
        script (str): The script containing placeholders to be replaced.
        template_name (str): The name of the template placeholder without angle brackets.
        template_value (str or list): The value to replace the placeholder with. If a list, it's assumed to contain
                                      three elements representing a vector.

    Returns:
        str: The script with placeholders replaced by their corresponding values.

    """
    tname = template_name.upper()
    if isinstance(template_value, list):
        tvalue = (
            f"<{template_value[0]}, {template_value[1]}, {template_value[2]}>"
        )
    else:
        tvalue = template_value

    script = script.replace(f"<<{tname}>>", tvalue)
    return script
