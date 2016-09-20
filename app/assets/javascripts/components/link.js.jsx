class Link extends React.Component {
  constructor(props) {
    super(props);
  }

  updateStatus() {
    var newStatus = $("input[type=checkbox]:checked").data("target");
    var linkId = $("input[type=checkbox]:checked").attr("id");

    var data = {link: { read: newStatus} };

    $.ajax({
        url: "/api/v1/links/" + linkId + ".json",
        method: "PATCH",
        data: data,
          success:(updatedLink) => {
            console.log("updated!")
          },
       });
  }

  render() {
    if ( this.props.link.read ) {
      return(
      <ul className='links-listing read' id={'link' + this.props.link.id} data-target="read">
        <h4>Mark As Unread
          <input type="checkbox" onClick={this.updateStatus.bind(this)} id={this.props.link.id} className="status-box" data-target="true"/>
        </h4>
        <li className='title'>{this.props.link.title}</li>
        <li className='url'>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
      </ul>
      );
     }
    else {
      return(
      <ul className='links-listing unread' id={'link' + this.props.link.id} data-target="unread">
        <h4>Mark As Read
          <input type="checkbox" onClick={this.updateStatus.bind(this)} id={this.props.link.id} className="status-box" data-target="false"/>
        </h4>
        <li className='title'>{this.props.link.title}</li>
        <li className='url'>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
      </ul>
      );
    }
  }
}
