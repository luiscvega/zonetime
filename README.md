# Zone Time (Beta)

### A simple REST API for converting one timezone to another

Built using Cuba. The API parses the query string in the url. For example:

`GET http://zonetime.herokuapp.com/api?year=2014&month=1&day=1&hour=12&minute=0&second=0&from=PHT&to=ART`

Returns:

```
{
  "date": "2014-01-01",
  "time": "01:00 AM",
  "timezone": {
    "code": "ART",
    "name": "Argentina Time"
  }
}
```
