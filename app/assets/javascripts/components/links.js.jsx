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

   sortLinks() {
     $.ajax({
         url: "/api/v1/links.json",
         method: "GET",
         success: (response) => {
           console.log(response);
           this.setState({links: response});
         },
      });
   }

  render() {
    var links = this.state.links.map( (link) => {
      return <Link key={link.id} handleUpdate={this.handleUpdate.bind(this)} link={link} />
    })
    return(
      <div>
        <button onClick={this.sortLinks.bind(this)} className="btn btn-warning" id="sorted-listing">Sort Alphabetically</button>
        <div>{links}</div>
      </div>
    );
  }
}
