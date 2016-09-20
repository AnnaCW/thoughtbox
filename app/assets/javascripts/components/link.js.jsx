class Link extends React.Component {
  constructor(props) {
    super(props);
  }

  findNewStatus(currentStatus) {
    if (currentStatus === true) {
      return false;
    }
    else {
      return true;
    }
  }

  updateStatus(event) {
    var currentStatus = this.props.link.read
    var newStatus = this.findNewStatus(currentStatus);
    var linkId = this.props.link.id
    var data = {link: { read: newStatus} };

    $.ajax({
        url: "/api/v1/links/" + linkId + ".json",
        method: "PATCH",
        data: data,
          success:(link) => {
            this.props.handleUpdate(link)
          },
      });
    }

  render() {
    if ( this.props.link.read ) {
      return(
      <ul className='links-listing read' id={'link' + this.props.link.id} data-target="read">
        <li className='title'>{this.props.link.title}</li>
        <li className='url'>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
        <button onClick={this.updateStatus.bind(this)} id={"button" + this.props.link.id} className="btn btn-primary btn-xs" data-target="false">Mark As Unread</button>
      </ul>
      );
     }
    else {
      return(
      <ul className='links-listing unread' id={'link' + this.props.link.id} data-target="unread">
        <li className='title'>{this.props.link.title}</li>
        <li className='url'>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
        <button onClick={this.updateStatus.bind(this)} id={"button" + this.props.link.id} className="btn btn-primary btn-xs" data-target="true">Mark As Read</button>
      </ul>
      );
    }
  }
}
