from django import template

register = template.Library()

@register.filter
def split_by_comma(value):
    return value.split(',')

@register.filter
def strip(value):
    return value.strip()