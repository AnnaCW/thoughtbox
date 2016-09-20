class Links extends React.Component {
  constructor(props) {
    super();
    this.state = {
      links: props.links
    }
  }

  render() {
    var links = this.state.links.map( (link) => {
      return <Link key={link.id} link={link} />
    })
    return(
      <div>{links}</div>
    );
  }
}
