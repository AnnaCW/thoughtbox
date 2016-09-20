class Links extends React.Component {
  constructor(props) {
    super();
    this.state = {
      links: props.links
    }
  }

  handleUpdate(link) {
    var links = this.state.links
    var updated = links.filter( (ls) => { return ls.id != link.id });
      updated.push(link);
      this.setState( {links: updated });

   }

  render() {
    var links = this.state.links.map( (link) => {
      return <Link key={link.id} handleUpdate={this.handleUpdate.bind(this)} link={link} />
    })
    return(
      <div>{links}</div>
    );
  }
}
