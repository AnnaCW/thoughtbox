class Link extends React.Component {
  constructor(props) {
    super(props);
  }

  updateStatus() {
    var newStatus = $("#button" + this.props.link.id).data("target");
    var linkId = this.props.link.id
    var data = {link: { read: newStatus} };

    this.props.handleUpdate(newStatus, linkId, data)
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
