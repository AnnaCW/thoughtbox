class Link extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    if ( this.props.link.read ) {
      return(
      <ul className='links-listing read' id={'link' + this.props.link.id} data-target="read">
        <h4>Mark As Unread
          <input type="checkbox" className="status-box" ref="true"/>
        </h4>
        <li>{this.props.link.title}</li>
        <li>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
      </ul>
      );
     }
    else {
      return(
      <ul className='links-listing unread' id={'link' + this.props.link.id} data-target="unread">
        <h4>Mark As Read
          <input type="checkbox" className="status-box" ref="false"/>
        </h4>
        <li>{this.props.link.title}</li>
        <li>{this.props.link.url}</li>
        <li><a href={"links/" + this.props.link.id + "/edit"}>Edit</a></li>
      </ul>
      );
    }
  }
}
