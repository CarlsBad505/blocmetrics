#Welcome to Blocmetrics!
###Blocmetrics is an analytical API application used to gather information from your websites and other third party applications.<h2>

**How to Use**
- If you're interested in using this source code, just fork and clone this repository
- If you're interested in using the application itself as a user, visit this Blocmetrics [click here](http://hidden-anchorage-1106.herokuapp.com) and follow the directions below:

================================================================================

**Directions**

1) Create a free user account.

2) Add your website or application.

3) Use the following javascript snippet and place in your `application.js` file. 
Be careful the order you place this snippet within the file, as it can mess with existing javascript. 

- 
```
var blocmetrics = {};
  blocmetrics.report = function(event){
    var event = {event: { name: event}};
    var request = new XMLHttpRequest();
    request.open("POST", "http://hidden-anchorage-1106.herokuapp.com/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
```

4) Then place this snippet on whichever page you want to track. Pass in the `name` of your event that you're tracking with a string:

```
 blocmetrics.report('name')
```

5) Step number 4 will track your event and the count. However, for more advanced tracking, you can dynamically tracking the name of an event with javascript tags like such (passing in an empty `val()`):

```
<script>
  $(document).ready(function(){
    $('#commit-and-send').on('click', function(){
      blocmetrics.report($('#attr-to-send').val())
    })
  })
</script>
```

##ENJOY!
